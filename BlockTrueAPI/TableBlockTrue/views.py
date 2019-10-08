from django.http import HttpResponse, JsonResponse
from .models import *
import json
from django.shortcuts import render

# Create your views here.

def index(request):
    return HttpResponse("Hello, world. You're at the block index.")

def login(request):
    if request.method == "GET":
        login = request.GET.get('login')
        senha = request.GET.get('senha')

        print(login)
        print(senha)
        # return JsonResponse({'retorno': login})

        if login and senha:
            usuario = Usuario.objects.filter(login=login, senha=senha)
            print(usuario.exists())
            if usuario.exists():
                return JsonResponse({'retorno': True, 'usuario': usuario.first().get_json()})

    return JsonResponse({'retorno': False})

def cadastro(request):
    if request.method == "GET":
        nome = request.GET.get('nome')
        login = request.GET.get('login')
        senha = request.GET.get('senha')

        usuario = Usuario(nome=nome, login=login, senha=senha)
        usuario.save()

        return JsonResponse({'retorno': True, 'usuario': usuario.get_json()})

