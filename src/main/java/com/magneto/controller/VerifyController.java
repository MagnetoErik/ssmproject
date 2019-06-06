package com.magneto.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.util.Random;

@Controller
public class VerifyController {

    @RequestMapping("/verify")
	protected void verify(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		// TODO Auto-generated method stub
		response.setContentType("image/jpeg");
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		int width = 72, height = 28;
		BufferedImage image = new BufferedImage(width, height,
				BufferedImage.TYPE_INT_RGB);

		Graphics g = image.getGraphics();

		Random random = new Random();

		g.setColor(getRandColor(200, 250));
		g.fillRect(0, 0, width, height);

		g.setFont(new Font("Comic Sans MS", Font.PLAIN, 18));
		String sRand = "";
		int start = 0;
		int end = 0;
		String[] arr1 = { "+", "x", "-" };
		start = random.nextInt(10);
		end = random.nextInt(10);
		g.setColor(new Color(20 + random.nextInt(110),
				20 + random.nextInt(110), 20 + random.nextInt(110)));
		g.drawString(String.valueOf(start), 13 * 0 + 6, 22);
		g.setColor(new Color(20 + random.nextInt(110),
				20 + random.nextInt(110), 20 + random.nextInt(110)));
		if (start > end) {
			int index = random.nextInt(3);
			if (index == 0) {
				sRand = String.valueOf((start + end));
				g.drawString(arr1[index], 13 * 1 + 6, 22);
			} else if (index == 1) {
				sRand = String.valueOf((start * end));
				g.drawString(arr1[index], 13 * 1 + 6, 22);
			} else {
				sRand = String.valueOf((start - end));
				g.drawString(arr1[index], 13 * 1 + 6, 22);
			}
		} else {
			int index = random.nextInt(2);
			if (index == 1) {
				g.drawString(arr1[index], 13 * 1 + 6, 22);
				sRand = String.valueOf((start * end));
			} else {
				g.drawString(arr1[index], 13 * 1 + 6, 22);
				sRand = String.valueOf((start + end));
			}
		}
		g.setColor(new Color(20 + random.nextInt(110),
				20 + random.nextInt(110), 20 + random.nextInt(110)));
		g.drawString(String.valueOf(end), 13 * 2 + 6, 22);
		g.setColor(new Color(20 + random.nextInt(110),
				20 + random.nextInt(110), 20 + random.nextInt(110)));
		g.drawString("=", 13 * 3 + 6, 22);
		g.drawString("?", 13 * 4 + 6, 22);
		for (int i = 0; i < 8; i++) {
			int x = random.nextInt(width);
			int y = random.nextInt(height);
			int xl = random.nextInt(12);
			int yl = random.nextInt(12);
			g.drawLine(x, y, x + xl, y + yl);
		}
		request.getSession(true).setAttribute("rand", sRand);
		g.dispose();
		ServletOutputStream out = response.getOutputStream();
		ImageIO.write(image, "JPEG", response.getOutputStream());
		out.flush();
		out.close();
	}
    
	
	private  Color interLine(int Low, int High){
        if(Low > 255)
            Low = 255;
        if(High > 255)
            High = 255;
        if(Low < 0)
            Low = 0;
        if(High < 0)
            High = 0;
        int interval = High - Low;
        int r = Low + (int)(Math.random() * interval);
        int g = Low + (int)(Math.random() * interval);
        int b = Low + (int)(Math.random() * interval);
        return new Color(r, g, b);
      }


	public Color getRandColor(int fc, int bc) {
	    Random random = new Random();
		if (fc > 255)
			fc = 255;
		if (bc > 255)
			bc = 255;
		int r = fc + random.nextInt(bc - fc);
		int g = fc + random.nextInt(bc - fc);
		int b = fc + random.nextInt(bc - fc);
		return new Color(r, g, b);
	}
}
