import { kafka } from "./client";

async function init() {
    const admin = kafka.admin();
    await admin.connect();
    console.log("Admin Connected");

    await admin.createTopics({
        topics: [
            {
                topic: "rider-updated",
                numPartitions: 2,
            },
        ],
    });
    console.log("Topic Created [rider-updated]");
    await admin.disconnect();
    console.log("Admin Disconnected");
}

init();
