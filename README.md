# turkish-ocr-service

## docker run

```bash
 docker run -p 5000:5000 monar2/turkish-ocr-service
```

## check service status
```bash
curl -X GET http://localhost:5001
```
result
```json
{
  "msg": "UP"
}
```


## to use ocr service

```bash
curl -X POST http://localhost:5001/loadImage  -H 'Content-Type: application/json' -d '{"image":"[base64string]"}'
```
result 
```json
{
  "text": "ABC"
}
```


example
```bash
curl -X POST http://localhost:5001/loadImage \
 -H 'Content-Type: application/json' \
 -d '{"image":"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"}'
```



