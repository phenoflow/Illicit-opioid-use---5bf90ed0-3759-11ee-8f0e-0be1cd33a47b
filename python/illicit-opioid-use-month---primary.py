# Lewer D, Padmanathan P, Arfeen A, Denaxas S, Forbes H, Gonzalez-Izquierdo A, Hickman M, 2023.

import sys, csv, re

codes = [{"code":"x987521000006119","system":"med"},{"code":"x987531000006116","system":"med"},{"code":"x987521000006119","system":"prod"},{"code":"x987531000006116","system":"prod"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('illicit-opioid-use-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["illicit-opioid-use-month---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["illicit-opioid-use-month---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["illicit-opioid-use-month---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)