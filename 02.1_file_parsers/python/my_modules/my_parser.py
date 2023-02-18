import json
import csv
import yaml
import xml.etree.ElementTree as ET

class ClassParser:
    # def __init__(self):
    #     pass
  
    def parse_txt_file(self, file_path):
        with open(file_path, "r") as f:
            #return f.read()
            contents = f.read()
            print(contents)

    def parse_xml_file(self, file_path):
        tree = ET.parse(file_path)
        print(tree.getroot())
        return tree.getroot()

    def parse_yaml_file(self, file_path):
        with open(file_path, "r") as f:
            content = yaml.safe_load(f)
            print(content)
            return content

    def parse_json_file(self, file_path):
        with open(file_path, "r") as f:
            print(json.load(f))
            return json.load(f)

    def parse_csv_file(self, file_path):
        with open(file_path, "r") as f:
            reader = csv.reader(f)
            print(list(reader))
            return list(reader)
            

    def read_and_parse_file(self, file_path):
        file_extension = file_path.split(".")[-1].lower()
        if file_extension == "txt":
            return self.parse_txt_file(file_path)
        elif file_extension == "xml":
            return self.parse_xml_file(file_path)
        elif file_extension == "yaml":
            return self.parse_yaml_file(file_path)
        elif file_extension == "json":
            return self.parse_json_file(file_path)
        elif file_extension == "csv":
            return self.parse_csv_file(file_path)
        else:
            raise ValueError("Unsupported file format")

