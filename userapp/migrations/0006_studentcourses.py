# Generated by Django 5.0.2 on 2024-02-23 07:34

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('instructorapp', '0005_question'),
        ('userapp', '0005_cartmodel'),
    ]

    operations = [
        migrations.CreateModel(
            name='StudentCourses',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('amount', models.IntegerField(default=0, help_text='Enter fee')),
                ('payment_status', models.CharField(default='pending', max_length=100)),
                ('purchase_date', models.DateField(auto_now_add=True, null=True)),
                ('payment_id', models.CharField(max_length=200)),
                ('order_id', models.CharField(max_length=200)),
                ('course', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='instructorapp.addcourse')),
                ('student', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='student_courses', to='userapp.studentregmodel')),
            ],
            options={
                'db_table': 'student_courses_details',
            },
        ),
    ]