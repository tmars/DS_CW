#coding=utf8

STATUS_CHOICE = (
    ('reserve', u'Зарезервировано'),
    ('payed', u'Оплачено'),
    ('cancelled', u'Отменено'),
)

BODY_CHOICE = (
    ('u', u'Универсал'),
    ('h', u'Хетчбек'),
    ('s', u'Седан'),
    ('p', u'Купе'),
    ('c', u'Кабриолет'),
)

CLASS_CHOICE = (
    ('l', u'Эконом класс'),
    ('m', u'Средний класс'),
    ('h', u'Бизнес класс'),
)

BRAND_CHOICE = (
    (1, u'Audi'),
    (2, u'BMW'),
    (3, u'Ford'),
    (4, u'Honda'),
    (5, u'Lexus'),
    (6, u'Kia'),
    (7, u'Nissan'),
    (8, u'Mazda'),
    (9, u'Skoda'),
    (10, u'Renault'),
    (11, u'Infiniti'),
    (12, u'Hyundai'),
    (13, u'Fiat'),
    (14, u'Citroen'),
    (15, u'Opel'),
)

def get_choice(key, CHOICE):
    for (k, v) in CHOICE:
        if k == key:
            return v