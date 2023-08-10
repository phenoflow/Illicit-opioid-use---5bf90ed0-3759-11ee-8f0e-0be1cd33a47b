# Lewer D, Padmanathan P, Arfeen A, Denaxas S, Forbes H, Gonzalez-Izquierdo A, Hickman M, 2023.

import sys, csv, re

codes = [{"code":"x100632","system":"med"},{"code":"x106342","system":"med"},{"code":"x11722","system":"med"},{"code":"x16374","system":"med"},{"code":"x1655941000033119","system":"med"},{"code":"x1656041000033112","system":"med"},{"code":"x1976591000006112","system":"med"},{"code":"x2003041000033115","system":"med"},{"code":"x2052541000033112","system":"med"},{"code":"x2267741000033115","system":"med"},{"code":"x28976","system":"med"},{"code":"x2952","system":"med"},{"code":"x302981000000113","system":"med"},{"code":"x303011000000111","system":"med"},{"code":"x30694","system":"med"},{"code":"x33068","system":"med"},{"code":"x33832","system":"med"},{"code":"x346949015","system":"med"},{"code":"x475771000000117","system":"med"},{"code":"x475831000000113","system":"med"},{"code":"x47706","system":"med"},{"code":"x4815541000033118","system":"med"},{"code":"x495611000000112","system":"med"},{"code":"x512101000000118","system":"med"},{"code":"x512271000000119","system":"med"},{"code":"x512281000000117","system":"med"},{"code":"x55825","system":"med"},{"code":"x60355","system":"med"},{"code":"x6111","system":"med"},{"code":"x630131000006118","system":"med"},{"code":"x85097","system":"med"},{"code":"x86771","system":"med"},{"code":"x888541000033115","system":"med"},{"code":"x90198","system":"med"},{"code":"x92404","system":"med"},{"code":"x93109","system":"med"},{"code":"x968841000006110","system":"med"},{"code":"x968871000006119","system":"med"},{"code":"x968901000006119","system":"med"},{"code":"x968931000006110","system":"med"},{"code":"x968951000006115","system":"med"},{"code":"x968961000006118","system":"med"},{"code":"x968981000006111","system":"med"},{"code":"x9728","system":"med"},{"code":"x100632","system":"prod"},{"code":"x106342","system":"prod"},{"code":"x11722","system":"prod"},{"code":"x16374","system":"prod"},{"code":"x1655941000033119","system":"prod"},{"code":"x1656041000033112","system":"prod"},{"code":"x1976591000006112","system":"prod"},{"code":"x2003041000033115","system":"prod"},{"code":"x2052541000033112","system":"prod"},{"code":"x2267741000033115","system":"prod"},{"code":"x28976","system":"prod"},{"code":"x2952","system":"prod"},{"code":"x302981000000113","system":"prod"},{"code":"x303011000000111","system":"prod"},{"code":"x30694","system":"prod"},{"code":"x33068","system":"prod"},{"code":"x33832","system":"prod"},{"code":"x346949015","system":"prod"},{"code":"x475771000000117","system":"prod"},{"code":"x475831000000113","system":"prod"},{"code":"x47706","system":"prod"},{"code":"x4815541000033118","system":"prod"},{"code":"x495611000000112","system":"prod"},{"code":"x512101000000118","system":"prod"},{"code":"x512271000000119","system":"prod"},{"code":"x512281000000117","system":"prod"},{"code":"x55825","system":"prod"},{"code":"x60355","system":"prod"},{"code":"x6111","system":"prod"},{"code":"x630131000006118","system":"prod"},{"code":"x85097","system":"prod"},{"code":"x86771","system":"prod"},{"code":"x888541000033115","system":"prod"},{"code":"x90198","system":"prod"},{"code":"x92404","system":"prod"},{"code":"x93109","system":"prod"},{"code":"x968841000006110","system":"prod"},{"code":"x968871000006119","system":"prod"},{"code":"x968901000006119","system":"prod"},{"code":"x968931000006110","system":"prod"},{"code":"x968951000006115","system":"prod"},{"code":"x968961000006118","system":"prod"},{"code":"x968981000006111","system":"prod"},{"code":"x9728","system":"prod"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('illicit-opioid-use-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["illicit-opioid-use-therapmethadone---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["illicit-opioid-use-therapmethadone---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["illicit-opioid-use-therapmethadone---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
