(DjangoProject) C:...\mysite>python manage.py shell
Python 3.11.0 (main, Oct 24 2022, 18:26:48) [MSC v.1933 64 bit (AMD64)] on win32
Type "help", "copyright", "credits" or "license" for more information.
(InteractiveConsole)
>>> from polls.models import Choice, Question
>>> Question.object.all()
Traceback (most recent call last):
  File "<console>", line 1, in <module>
AttributeError: type object 'Question' has no attribute 'object'
>>> Question.objects.all()
<QuerySet []>
>>> from django.utils import timezone
>>> q = Question(question_text = "What's new?", pub_date = timezone.now())
>>> q.save()
>>> q.id()
Traceback (most recent call last):
  File "<console>", line 1, in <module>
TypeError: 'int' object is not callable
>>> q.id
1
>>> q.question_text
"What's new?"
>>> q.pub_date
datetime.datetime(2023, 2, 23, 23, 41, 9, 248993, tzinfo=<UTC>)
>>> q.question_text = "what's up?"
>>> q.save()
>>> q.question_text
"what's up?"
>>> Question.objects.all()
<QuerySet [<Question: Question object (1)>]>
>>> exit()

(DjangoProject) C:....\mysite>python manage.py shell
Python 3.11.0 (main, Oct 24 2022, 18:26:48) [MSC v.1933 64 bit (AMD64)] on win32
Type "help", "copyright", "credits" or "license" for more information.
(InteractiveConsole)
>>> from polls.models import Choice, Question
>>> Question.objects.all()
<QuerySet [<Question: what's up?>]>
>>> Question.objects.filter(id=1)
<QuerySet [<Question: what's up?>]>
>>> Question.objects.filter(question_text="What's up?")
<QuerySet []>
>>> Question.objects.filter(question_text="what's up?")
<QuerySet [<Question: what's up?>]>
>>> Question.objects.filter(question_text__startswith="what")
<QuerySet [<Question: what's up?>]>
>>> from django.utils import timezone
>>> current_year = timezone.now().year()
Traceback (most recent call last):
  File "<console>", line 1, in <module>
TypeError: 'int' object is not callable
>>> current_year = timezone.now().year
>>> Question.objects.get(pub_date__year = current_year)
<Question: what's up?>
>>> q = Question.objects.get(pub_date__year = current_year)
>>> q.choice_set.all)
  File "<console>", line 1
    q.choice_set.all)
                    ^
SyntaxError: unmatched ')'
>>> q.choice_set.all()
<QuerySet []>
>>> q.choice_set.create(choice_text = "The sky is blue", votes = 0)
<Choice: The sky is blue>
>>> q.choice_set.create(choice_text = "cloudy", votes = 0)
<Choice: cloudy>
>>> q.choice_set.create(choice_text = "Django is interesting concept", votes = 0)
<Choice: Django is interesting concept>
>>> Choice.objects.all()
<QuerySet [<Choice: The sky is blue>, <Choice: cloudy>, <Choice: Django is interesting concept>]>
>>> for c in Choice.objects.all():
...     print(c.question)
...
what's up?
what's up?
what's up?
>>>
