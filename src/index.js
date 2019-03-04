const AWS = require('aws-sdk');

async function main() {
    
    try {
        const s3 = new AWS.S3();
        const { Buckets } = await s3.listBuckets().promise();
        return {
            statusCode: 200,
            body: JSON.stringify({
                amountOfBuckets: Buckets.length,
            }),
        }
    } catch (err) {
        throw err;
    }

};

module.exports.handler = main;