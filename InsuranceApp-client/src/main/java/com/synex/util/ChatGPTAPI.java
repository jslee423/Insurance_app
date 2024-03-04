package com.synex.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

public class ChatGPTAPI {

	public static String chatGPT(String prompt) {
		String url = "https://api.openai.com/v1/chat/completions";
		String apiKey = "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";
		String model = "gpt-3.5-turbo";
		
		try {
			URL obj = new URL(url);
			HttpURLConnection connection = (HttpURLConnection)obj.openConnection();
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Authorization", "Bearer " + apiKey);
			connection.setRequestProperty("Content-Type", "application/json");
			
			//request body
			String body = "{\"model\": \"" + model + "\", \"messages\": [{\"role\": \"user\", \"content\": \"" + prompt + "\"}]}";
			connection.setDoOutput(true);
			OutputStreamWriter writer = new OutputStreamWriter(connection.getOutputStream());
			writer.write(body);
			writer.flush();
			writer.close();
			
			//response from ChatGPT
			BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			String line;
			
			StringBuffer response = new StringBuffer();
			
			while ((line = br.readLine()) != null) {
				response.append(line);
			}
			br.close();
			
			// calls the method to extract the message.
			return extractMessageFromJSONResponse(response.toString());
			
		} catch(IOException e) {
			throw new RuntimeException(e);
		}
	} 
	
	public static String extractMessageFromJSONResponse(String response) {
		int start = response.indexOf("content")+ 11;
		int end = response.indexOf("\"", start);
		
		return response.substring(start, end);
	} 
}
