using System;

namespace sample1 {
    class Program {
        static void Main (string[] args) {
            Calc calc = new Calc ();

            Console.Write ("{0} + {1} = {2}\n", calc.X, calc.Y, calc.Sum);
            // 5 + 10 = 15
        }
    }
    // 「実装の隠蔽」で作った複素数クラス
    class Calc {
        // xの書き換え・取り出し（プロパティ）
        public double X { get; set; } = 5; // プロパティ初期化子

        // xの書き換え・取り出し（プロパティ）
        public double Y { get; set; } = 10; // プロパティ初期化子

        // 和を計算
        public double Sum {
            // 読み取り専用のプロパティ（setブロックを書かない）
            get { return X + Y; }
        }
    }
}