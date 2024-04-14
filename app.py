from fastapi import FastAPI, Request

app = FastAPI()


def _get_request_info(request):
    pass


@app.get('/')
async def root():
    return {'message': 'Hello World'}


@app.get('/request1')
async def request1(request: Request):
    return {
       'path': '/request1',
       'request': request.headers,
       'query_params': request.query_params,
    }


@app.get('/request2')
async def request2(request: Request):
    return {
       'path': '/request2',
       'request': request.headers,
       'query_params': request.query_params,
    }

