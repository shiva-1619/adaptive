# Generated by Django 4.2.1 on 2024-03-02 07:24

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('userapp', '0011_alter_resultmodel_useranswer'),
    ]

    operations = [
        migrations.AlterField(
            model_name='resultmodel',
            name='correctanswer',
            field=models.CharField(max_length=999),
        ),
        migrations.AlterField(
            model_name='resultmodel',
            name='question',
            field=models.CharField(max_length=999),
        ),
        migrations.AlterField(
            model_name='resultmodel',
            name='test_name',
            field=models.CharField(max_length=509),
        ),
        migrations.AlterField(
            model_name='resultmodel',
            name='useranswer',
            field=models.CharField(max_length=999, null=True),
        ),
    ]
