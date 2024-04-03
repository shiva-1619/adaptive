# Generated by Django 5.0.2 on 2024-02-23 07:15

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('instructorapp', '0005_question'),
        ('userapp', '0004_studentregmodel_otp_studentregmodel_otp_status'),
    ]

    operations = [
        migrations.CreateModel(
            name='CartModel',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('cart_booking', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='instructorapp.addcourse')),
                ('cart_user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='userapp.studentregmodel')),
            ],
            options={
                'db_table': 'cart_details',
            },
        ),
    ]