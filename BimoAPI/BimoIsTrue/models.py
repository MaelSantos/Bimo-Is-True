
from django.db import models

# Create your models here.

class Usuario(models.Model):
    nome = models.CharField(max_length=200)
    login = models.CharField(max_length=200)
    senha = models.CharField(max_length=200)
    logado = models.BooleanField(default=False)

    def __str__(self):
        return self.nome

    def get_json(self):
        return dict(
            id=self.pk,
            nome=self.nome,
            login=self.login,
            senha=self.senha
        )

class Fase(models.Model):
    nome = models.CharField(max_length=200)

    def __str__(self):
        return self.nome

    def get_json(self):
        return dict(
            id=self.pk,
            nome=self.nome,
        )

class Log(models.Model):
    pontuacao = models.IntegerField(default=0)
    data = models.DateField(max_length=200)
    tempo = models.CharField(max_length=200)
    acertado = models.BooleanField(default=False)
    fase = models.ForeignKey(Fase, on_delete=models.CASCADE)
    usuario = models.ForeignKey(Usuario, on_delete=models.CASCADE)

    def __str__(self):
        return self.pontuacao

    def get_json(self):
        return dict(
            id=self.pk,
            pontuacao=self.pontuacao,
            data=self.data,
            tempo=self.tempo,
            acertado=self.acertado
        )