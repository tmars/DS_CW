import random
import sys
import StringIO
import csv
import os
from datetime import datetime

os.sys.path.insert(0,os.path.dirname(os.path.dirname(os.path.abspath(__file__)))) 
from lib.models import BRAND_CHOICE

def random_line(afile):
    line = next(afile)
    for num, aline in enumerate(afile):
      if random.randrange(num + 2): continue
      line = aline
    return line


BODY_TYPES = {
    'Coupe': 'p',
    'Cabrio': 'c',
    'Combi': 'u',
    'Hatchback': 'h',
    'Sedan/saloon': 's',
}

BODY_TYPES = {
    'Coupe': 'p',
    'Cabrio': 'c',
    'Combi': 'u',
    'Hatchback': 'h',
    'Sedan/saloon': 's',
}

CLASS_TYPES = {
    'Concept': 'h',
    'Cabrio / Sport Cars': 'h',
    'Cargo Vans': 'h',
    'Large / Luxury Cars': 'h',
    'Limousines': 'h',
    
    'Family cars': 'm',
    'Van / Minivan': 'm',
    
    'Small / Economy Cars': 'l',
    'Mini-cars': 'l',
}

PERCENTS = [0.9, 0.75, 0.6]

image_path = "..\office_sys\office_sys\media\images\cars"
image_prefix = "images/cars/"
images = os.listdir(image_path)

count = 0
rows = []
while count < int(sys.argv[1]):
    f = open('vehicles.csv')
    fs = StringIO.StringIO(random_line(f))
    reader = csv.reader(fs, delimiter=',')
    for row in reader:
        brand_name = row[1]
        model_name = row[2]
        class_name = row[4]
        body_name = row[25]
        brand_type = [i for i, v in enumerate(BRAND_CHOICE) if v[1] == brand_name]
        if len(brand_type) > 0 and body_name in BODY_TYPES.keys():
            
            brand_type = brand_type[0]
            
            body_type = BODY_TYPES[body_name]
            
            if class_name in CLASS_TYPES.keys():
                class_type = CLASS_TYPES[class_name]
            else:
                class_type = random.choice(CLASS_TYPES.values())
            
            pub_date = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            
            image = image_prefix + random.choice(images)
            
            if class_type == 'h':
                tarif = random.randint(100, 200)
            elif class_type == 'm':
                tarif = random.randint(100, 150)
            elif class_type == 'l':
                tarif = random.randint(50, 100)
                
            row = [model_name, pub_date, body_type, class_type, image, brand_type]
            row.append(tarif)
            for i in range(0,3):
                row.append(int(tarif * PERCENTS[i]))
            
            row = [str(i) for i in row]    
            rows.append("('"+ "', '".join(row) + "')")
            count += 1
    
print 'INSERT INTO catalog_car'
print '(model_name, pub_date, body_type, class_type, image, brand_type, tarif1, tarif2, tarif3, tarif4)'
print 'VALUES ' + ',\n'.join(rows)