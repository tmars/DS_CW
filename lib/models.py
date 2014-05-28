#coding=utf8

BODY_CHOICE = (
    ('u', u'Универсал'),
    ('h', u'Хетчбек'),
    ('s', u'Седан'),
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
    (11, u'Infinity'),
    (12, u'Hyundai'),
    (13, u'Fiat'),
)

def get_choice(key, CHOICE):
    for (k, v) in CHOICE:
        if k == key:
            return v