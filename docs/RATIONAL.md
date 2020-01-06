# Rational

## Updates receiving
You can receive updates from any resource, like polling or rabbitmq.
It's possible because ultragram provides a simple abstraction over updates receiving. Further we will call it as 'Receiver'. Out of the box available polling, but you can create own in minutes, for example for getting updates from RabbitMQ.In pseudocode it will look like this:

```py
class RabbitMQReceiver(AbstractReceiver):
    async def get_updates(self):
        updates = self.rabbitmq.get_updates()
        filtered_updates = self.filter_updates(updates)
        return filtered_updates

    async def main(self):
        while True:
            for upd in (await self.get_updates()):
                yield upd
```

