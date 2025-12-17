import { randomUUID } from "crypto";
import { DynamoDBClient } from "@aws-sdk/client-dynamodb";
import {
  DynamoDBDocumentClient,
  PutCommand,
  ScanCommand,
} from "@aws-sdk/lib-dynamodb";

const TABLE_NAME = process.env.TABLE_NAME || "students";
const ddb = DynamoDBDocumentClient.from(new DynamoDBClient({}));

const json = (statusCode, body) => ({
  statusCode,
  headers: {
    "Content-Type": "application/json",
    "Access-Control-Allow-Origin": "*",
  },
  body: JSON.stringify(body),
});

export const handler = async (event) => {
  console.log("Incoming event:", JSON.stringify(event)?.slice(0, 2000));

  const method =
    event?.requestContext?.http?.method || event?.httpMethod || "UNKNOWN";
  const path = event?.rawPath || event?.path || "";

  try {
    
    if (method === "GET" && path.endsWith("/students")) {
      const limit = Math.min(parseInt(event?.queryStringParameters?.limit || "50", 10), 200);

      const data = await ddb.send(
        new ScanCommand({
          TableName: TABLE_NAME,
          Limit: limit,
        })
      );

      return json(200, {
        count: data?.Items?.length ?? 0,
        items: data?.Items ?? [],
      });
    }

    
    if (method === "POST" && path.endsWith("/submit")) {
      let rawBody = event?.body;
      if (!rawBody) return json(400, { error: "Missing request body" });

      if (event?.isBase64Encoded) {
        rawBody = Buffer.from(rawBody, "base64").toString("utf-8");
      }

      let payload;
      try {
        payload = JSON.parse(rawBody);
      } catch {
        return json(400, { error: "Request body must be valid JSON" });
      }

      const id = randomUUID();
      const timestamp = new Date().toISOString();

      await ddb.send(
        new PutCommand({
          TableName: TABLE_NAME,
          Item: { id, timestamp, payload },
        })
      );

      console.log("PutItem success:", { id, timestamp });

      return json(200, {
        message: "Student submitted successfully",
        id,
        timestamp,
      });
    }

    
    return json(404, { error: "Not Found" });
  } catch (err) {
    console.error("Unhandled error:", err);
    return json(500, { error: "Internal server error" });
  }
};