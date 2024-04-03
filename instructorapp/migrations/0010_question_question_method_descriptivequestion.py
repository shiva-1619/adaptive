# Generated by Django 4.2.1 on 2024-02-28 18:01

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('instructorapp', '0009_question_question_type'),
    ]

    operations = [
        migrations.AddField(
            model_name='question',
            name='question_method',
            field=models.CharField(default='mcqs', max_length=20),
        ),
        migrations.CreateModel(
            name='DescriptiveQuestion',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('question_text', models.TextField()),
                ('correct_answer', models.TextField()),
                ('question_type', models.CharField(choices=[('easy', 'Easy'), ('medium', 'Medium'), ('hard', 'Hard')], max_length=10, null=True)),
                ('question_method', models.CharField(default='descriptive', max_length=20)),
                ('course', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='instructorapp.addcourse')),
                ('instructor', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='instructorapp.instructorregmodel')),
            ],
            options={
                'db_table': 'DescriptiveQuestions',
            },
        ),
    ]
