using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace FileOperations
{
    class FileOperation
    {
        public void createFile()
        {
            Console.Write("Enter FileName To Create:");
            string fname=Console.ReadLine();
            string path= @"C:\Users\91708\source\repos\"+fname+".txt";
            FileStream fs = File.Create(path);
            Console.Write("File created successfully");
           
        }
        public void writeInFile()
        {
            Console.Write("Enter FileName:");
            string fname = Console.ReadLine();
            string path = @"C:\Users\91708\source\repos\" + fname + ".txt";
            Console.Write("choice 'a' for single line textand 'b' for multiline text\nEnter Choice for data:");
            
            string choice = Console.ReadLine();
            if (choice == "a")
            {
                Console.Write("Enter text in file");
                string text = Console.ReadLine();
                string createText = text + Environment.NewLine;
                File.WriteAllText(path, createText);
                Console.WriteLine("File Content added");
                
            }
            else if(choice == "b")
            {
                Console.Write("Enter No of data:");
                int n = Convert.ToInt32(Console.ReadLine());
                String[] name = new String[20];
                for (int i = 0; i <= n; i++)
                {
                    Console.Write("Enter String" +" "+ i + ":");
                    name[i] = Console.ReadLine();
                    

                }
                File.WriteAllLines(path, name);
                Console.WriteLine("File content added");

            }

        }

        public void readFromFile()
        {
            Console.Write("Enter FileName:");
            string fname = Console.ReadLine();
            string path = @"C:\Users\91708\source\repos\" + fname + ".txt";
            string readText = File.ReadAllText(path);
                Console.WriteLine(readText);
        }
        public void appendFile()
        {
            Console.Write("Enter FileName:");
            string fname = Console.ReadLine();
            string path = @"C:\Users\91708\source\repos\" + fname + ".txt";
            Console.Write("Enter append text in file:");
            string text = Console.ReadLine();
            using (StreamWriter s = new StreamWriter(path, true))
            {
                s.WriteLine(text);
            }
            using (StreamReader sr = File.OpenText(path))
            {
                string s = "";
                Console.WriteLine(" Here is the content of the file after appending the text : ");
                while ((s = sr.ReadLine()) != null)
                {
                    Console.WriteLine(s);
                }
            }
            Console.Write("'Text appended'\n");

        }
        public void concatFileContent()
        {
            try
            {
                Console.Write("Enter FileName1:");
                string fname1 = Console.ReadLine();
               // String[] content=new String[20];
                string path1 = @"C:\Users\91708\source\repos\" + fname1 + ".txt";
                string[] readText = File.ReadAllLines(path1);
               
                Console.Write("Enter FileName2:");
                string fname2 = Console.ReadLine();
                string path2 = @"C:\Users\91708\source\repos\" + fname2 + ".txt";
               using(StreamWriter wr =new StreamWriter(path2,true))
                {
                    foreach(string i in readText)
                    {
                        wr.WriteLine(i);
                    }
                }
                Console.Write("Enter FileName3 to store the result:");
                string fname3 = Console.ReadLine();
                string path3 = @"C:\Users\91708\source\repos\" + fname3 + ".txt";
               
                    using (StreamWriter s = new StreamWriter(path3, true))
                    {
                    string[] n = File.ReadAllLines(path2);
                    foreach (string i in n)
                    {
                        s.WriteLine(i);
                    }
                    Console.Write("Add Result in third file\n");
                }

                
            }
            catch(Exception e)
            {
                Console.WriteLine(e);            }

        }
        public void copyFile()
        {
            Console.Write("Enter FileName to be copied in new file:");
            string fname1 = Console.ReadLine();
            string path1 = @"C:\Users\91708\source\repos\" + fname1 + ".txt";
            Console.Write("Enter New FileName:");
            string fname2 = Console.ReadLine();
            string path2 = @"C:\Users\91708\source\repos\" + fname2 + ".txt";
            File.Copy(path1, path2);
        }
        public void renameFile()
        {
            Console.Write("Enter FileName to be replce with new file:");
            string fname1 = Console.ReadLine();
            string path1 = @"C:\Users\91708\source\repos\" + fname1 + ".txt";
            Console.Write("Enter New FileName:");
            string fname2 = Console.ReadLine();
            string path2 = @"C:\Users\91708\source\repos\" + fname2 + ".txt";

            File.Move(path1, path2);
        }

    }
}
