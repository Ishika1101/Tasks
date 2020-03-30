using System;

namespace FileOperations
{
    class Program
    {
        static void Main(string[] args)
        {
            int choice;
            FileOperation obj = new FileOperation();
            do
            {
                Console.Write("Choices:1-create\n2-write\n3-read\n4-append\n5-concate\n6-copy\n7-rename\n");

                Console.WriteLine("Enter Choice:");
                 choice = Convert.ToInt32(Console.ReadLine());
                switch (choice)
                {
                    case 1:
                        
                        obj.createFile();
                        break;
                    case 2:
                        
                       obj.writeInFile();
                        break;
                    case 3:
                        
                        obj.readFromFile();
                        break;
                    case 4:
                        
                        obj.appendFile();
                        break;
                    case 5:
                       
                        obj.concatFileContent();
                        break;
                    case 6:
                        
                        obj.copyFile();
                        break;
                    case 7:
                        
                        obj.renameFile();
                        break;
                    default:
                        Console.WriteLine("Exit");
                        break;
                }
            } while (choice != 8);
        }
    }
}
