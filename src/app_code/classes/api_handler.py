async def foo(request):
    mybody = await request.body();
    mydata = {
        "request.method":request.method,
        "request.url":request.url,
        "request.url.path":request.url.path,
        "request.url.port":request.url.port,
        "request.url.scheme":request.url.scheme,
        "request.headers": request.headers,
        "request.query_params": request.query_params,
        "request.path_params": request.path_params,
        "await request.body()": mybody,
        "ip": request.client,
        "body": mybody
    };
    return mydata