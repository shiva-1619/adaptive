# Generated by Django 5.0.2 on 2024-02-23 08:44

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('instructorapp', '0007_addcourse_question'),
    ]

    operations = [
        migrations.AlterField(
            model_name='addcourse',
            name='price',
            field=models.IntegerField(default=0, help_text='Enter fee '),
        ),
    ]