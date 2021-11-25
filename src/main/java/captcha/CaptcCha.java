package captcha;
import java.io.IOException;
import java.util.ArrayList;
import java.awt.Color;
import java.awt.Font;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CaptcCha {
	private static final long serialVersionUID = 1L;
	private static int width = 150;
	private static int height = 50;
	
	public void getCaptCha(HttpServletRequest req, HttpServletResponse res) throws IOException{
		// 폰트 설정
		List<Font> fontList = new ArrayList<Font>();
		fontList.add(new Font("", Font.HANGING_BASELINE, 40));
		fontList.add(new Font("Courier", Font.ITALIC,40));
		fontList.add(new Font("", Font.PLAIN, 40));
		List<Color> colorList = new ArrayList<Color>();
		colorList.add(Color.green);
	}
}
