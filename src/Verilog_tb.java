import java.io.FileWriter;
import java.io.IOException;
import java.util.Random;

public class Verilog_tb {

	public static void main(String[] args) throws IOException {
		Random rand = new Random();
		int data;
		String bs;	//ת��Ϊ�������ַ���

		FileWriter fw = new FileWriter("test.txt");
		for(int i = 0; i < 503; i++) {	//cache��װ��512�����ݣ�coe�ļ�����9������������503���ͺ�
			data = rand.nextInt(1000)+1;	//����1~1000�������
			bs = Integer.toBinaryString(data);
			fw.write(bs+","+"\n");	//д���ļ�,ÿ��������Ӣ�Ķ��ŷָ�
			System.out.println(bs);
			fw.flush();
		}
		fw.close();
	}

}
