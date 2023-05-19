using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace Flex.Classes
{
    public static class EncryptionUtility
    {
        private static int[] KEYS = { 32, 7, 19, 8 }; // encryption keys

        public static string Encrypt(string plainText)
        {
            if (!string.IsNullOrEmpty(plainText))
            {
                StringBuilder cipherText = new StringBuilder(plainText.Length);

                for (int i = 0; i < plainText.Length; i++)
                {
                    char c = (char)(plainText[i] + KEYS[i % KEYS.Length]);
                    cipherText.Append(c);
                }

                return cipherText.ToString();
            }
            return plainText;
        }

        public static string Decrypt(string cipherText)
        {
            if (!string.IsNullOrEmpty(cipherText))
            {
                StringBuilder plainText = new StringBuilder(cipherText.Length);

                for (int i = 0; i < cipherText.Length; i++)
                {
                    char c = (char)(cipherText[i] - KEYS[i % KEYS.Length]);
                    plainText.Append(c);
                }

                return plainText.ToString();

            }
            return cipherText;
        }
    }
}