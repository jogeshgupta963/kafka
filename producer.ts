import { kafka } from "./client";

async function init() {
    const producer = kafka.producer();
    await producer.connect();
    console.log("Producer Connected ");
    await producer.send({
        topic: "rider-updates",
        messages: [
            {
                partition: 0,
                key: "data",
                value: JSON.stringify({
                    name: "Toney Stark",
                    loc: "Dharavi",
                }),
            },
        ],
    });

    await producer.disconnect();
}

init();
