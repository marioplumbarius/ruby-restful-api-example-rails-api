# Monitoring

## Logging
All messages are logged to `stdout` as event streams, following the ideas from [12 factor app](https://12factor.net/logs).

## Traceability
**What**  
Every time a request is made, an unique ID is generated, added to the response header `X-Request-Id` and to all logged messages.

**How**  
Using rails' [ActionDispatch::RequestId](http://api.rubyonrails.org/classes/ActionDispatch/RequestId.html) middleware.
