from django.db import models

# Create your models here.

class Usuario(models.Model):
    nome = models.CharField(max_length=200)
    login = models.CharField(max_length=200)
    senha = models.CharField(max_length=200)
    logado = models.BooleanField(default=False)

class Fase(models.Model):
    nome = models.CharField(max_length=200)

class Log(models.Model):
    pontuacao = models.IntegerField(default=0)
    data = models.DateField(max_length=200)
    tempo = models.CharField(max_length=200)
    acertado = models.BooleanField(default=False)
    fase = models.ForeignKey(Fase, on_delete=models.CASCADE)
    usuario = models.ForeignKey(Usuario, on_delete=models.CASCADE)