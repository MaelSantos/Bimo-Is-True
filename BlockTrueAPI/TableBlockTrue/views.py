from django.http import HttpResponse
from .models import *
import json
from django.shortcuts import render

# Create your views here.

def index(request):
    return HttpResponse("Hello, world. You're at the polls index.")

def login(request):
    if request.method == "POST":
        usuario = Usuario.objetos.filter(login="").filter(senha="").fister()
        return json.encoder(usuario)
    else:
        json.dumps({'retorno':'erro'})

