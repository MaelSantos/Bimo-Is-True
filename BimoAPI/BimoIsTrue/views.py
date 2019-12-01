from django.http import HttpResponse, JsonResponse
from django.views.decorators.csrf import csrf_exempt

from .models import *
import json
from django.shortcuts import render

# Create your views here.

def index(request):
    return HttpResponse("Hello, world. You're at the block index.")

@csrf_exempt
def login(request):
    if request.method == "POST":
        login = request.POST.get('login')
        senha = request.POST.get('senha')

        print(login)
        print(senha)
        # return JsonResponse({'retorno': login})

        if login and senha:
            usuario = Usuario.objects.filter(login=login, senha=senha)
            print(usuario.exists())
            if usuario.exists():
                return JsonResponse({'retorno': True, 'usuario': usuario.first().get_json()})

    return JsonResponse({'retorno': False})

@csrf_exempt
def cadastro(request):
    if request.method == "POST":
        nome = request.POST.get('nome')
        login = request.POST.get('login')
        senha = request.POST.get('senha')

        usuario = Usuario(nome=nome, login=login, senha=senha)
        usuario.save()

        return JsonResponse({'retorno': True, 'usuario': usuario.get_json()})

