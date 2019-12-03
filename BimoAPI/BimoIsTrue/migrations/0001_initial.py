# Generated by Django 2.2.6 on 2019-12-03 11:58

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Fase',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nome', models.CharField(max_length=200)),
            ],
        ),
        migrations.CreateModel(
            name='Usuario',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nome', models.CharField(max_length=200)),
                ('login', models.CharField(max_length=200)),
                ('senha', models.CharField(max_length=200)),
                ('logado', models.BooleanField(default=False)),
            ],
        ),
        migrations.CreateModel(
            name='Log',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('pontuacao', models.IntegerField(default=0)),
                ('data', models.DateField(max_length=200)),
                ('tempo', models.CharField(max_length=200)),
                ('acertado', models.BooleanField(default=False)),
                ('fase', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='BimoIsTrue.Fase')),
                ('usuario', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='BimoIsTrue.Usuario')),
            ],
        ),
    ]
