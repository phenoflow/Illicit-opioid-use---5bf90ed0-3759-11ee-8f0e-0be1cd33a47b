# Lewer D, Padmanathan P, Arfeen A, Denaxas S, Forbes H, Gonzalez-Izquierdo A, Hickman M, 2023.

import sys, csv, re

codes = [{"code":"x512241000000113","system":"med"},{"code":"x512421000000117","system":"med"},{"code":"x86002","system":"med"},{"code":"x88760","system":"med"},{"code":"x512241000000113","system":"prod"},{"code":"x512421000000117","system":"prod"},{"code":"x86002","system":"prod"},{"code":"x88760","system":"prod"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('illicit-opioid-use-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["daily-illicit-opioid-use---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["daily-illicit-opioid-use---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["daily-illicit-opioid-use---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
