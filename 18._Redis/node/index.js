import redis from 'redis';

const redisClient = redis.createClient();

redisClient.on('error', (err) => {
    console.log('Error ' , err);
});

redisClient.on('connect', () => console.log('Redis client connected'));

await redisClient.connect();

redisClient.set('mykey', 'myvalue');
const value = await redisClient.get('mykey');
console.log(value);

//redisClient.setEx('mykey', 10, 'myvalue');