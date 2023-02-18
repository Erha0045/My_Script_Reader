using System;
using System.IO;
using System.Xml;
using System.Xml.Linq;
using System.Text.Json;
using System.Text.Json.Serialization;
using System.Text.RegularExpressions;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using YamlDotNet.Serialization;
using YamlDotNet.Serialization.NamingConventions;
using CsvHelper;

namespace FileParser
{
    class Program
    {
        static void Main(string[] args)
        {
            string filePath = "/Users/erhanbasaran/Desktop/TopUp/2.sem/SI/My_Script_Reader/data_formats/sample.txt"; // change the file path to your file
            string fileExtension = Path.GetExtension(filePath);

            switch (fileExtension)
            {
                case ".txt":
                    // parse text file
                    Console.WriteLine("Parsing text file...");
                    string text = File.ReadAllText(filePath);
                    Console.WriteLine(text);
                    break;

                case ".xml":
                    // parse XML file
                    Console.WriteLine("Parsing XML file...");
                    XDocument xmlDoc = XDocument.Load(filePath);
                    Console.WriteLine(xmlDoc);
                    break;

                case ".yaml":
                case ".yml":
                    // parse YAML file
                    Console.WriteLine("Parsing YAML file...");
                    var input = new StreamReader(filePath);
                    var deserializer = new DeserializerBuilder()
                        .WithNamingConvention(new CamelCaseNamingConvention())
                        .Build();
                    var yamlObject = deserializer.Deserialize(input);
                    Console.WriteLine(yamlObject);
                    break;

                case ".json":
                    // parse JSON file
                    Console.WriteLine("Parsing JSON file...");
                    string json = File.ReadAllText(filePath);
                    JObject jsonObject = JsonConvert.DeserializeObject<JObject>(json);
                    Console.WriteLine(jsonObject);
                    break;

                case ".csv":
                    // parse CSV file
                    Console.WriteLine("Parsing CSV file...");
                    var reader = new StreamReader(filePath);
                    var csv = new CsvReader(reader, System.Globalization.CultureInfo.InvariantCulture);
                    var records = csv.GetRecords<dynamic>();
                    foreach (var record in records)
                    {
                        Console.WriteLine(record);
                    }
                    break;

                default:
                    Console.WriteLine("Unknown file format.");
                    break;
            }
        }
    }
}
