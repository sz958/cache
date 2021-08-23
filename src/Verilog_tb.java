import java.io.FileWriter;
import java.io.IOException;
import java.util.Random;

public class Verilog_tb {

	public static void main(String[] args) throws IOException {
		Random rand = new Random();
		int data;
		String bs;	//转化为二进制字符串

		FileWriter fw = new FileWriter("test.txt");
		for(int i = 0; i < 503; i++) {	//cache共装入512个数据，coe文件中有9个，这里生成503个就好
			data = rand.nextInt(1000)+1;	//生成1~1000的随机数
			bs = Integer.toBinaryString(data);
			fw.write(bs+","+"\n");	//写入文件,每个数字用英文逗号分隔
			System.out.println(bs);
			fw.flush();
		}
		fw.close();
	}

}
