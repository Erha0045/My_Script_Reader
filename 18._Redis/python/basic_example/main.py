import redis

redis_client = redis.Redis(host='localhost', port=6379, db=0)

redis_client.set('key', 'value')
value = redis_client.get('key')

redis_client.setex

print(str (value, 'utf-8'))
