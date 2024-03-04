package com.synex.client;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

@Component
public class ClaimClient {

	public JsonNode findAllClaims() {
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<Object> responseEntity = restTemplate.getForEntity("http://localhost:8383/findAllClaims", Object.class);
		Object objects = responseEntity.getBody();
		
		ObjectMapper mapper = new ObjectMapper();
		JsonNode returnObj = mapper.convertValue(objects, JsonNode.class);
		
		return returnObj;
	}
	
	public JsonNode findClaimByStatus(String status) {
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<Object> responseEntity = restTemplate.getForEntity("http://localhost:8383/findClaimByStatus/"+status, Object.class);
		Object objects = responseEntity.getBody();
		
		ObjectMapper mapper = new ObjectMapper();
		JsonNode returnObj = mapper.convertValue(objects, JsonNode.class);
		
		return returnObj;
	}
	
	public JsonNode saveClaim(Long customerId, Long policyId, String claimDate, String reason, String description, Double amount, String claimDoc) {
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		
		ObjectMapper mapper = new ObjectMapper();
		JsonNode node = mapper.createObjectNode();
	    ((ObjectNode) node).put("customerId", customerId);
	    ((ObjectNode) node).put("policyId", policyId);
	    ((ObjectNode) node).put("claimDate", claimDate);
	    ((ObjectNode) node).put("reason", reason);
	    ((ObjectNode) node).put("description", description);
	    ((ObjectNode) node).put("amount", amount);
	    ((ObjectNode) node).put("claimDoc", claimDoc);
		
		HttpEntity<String> request = new HttpEntity<String>(node.toString(), headers);
		
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<Object> responseEntity = restTemplate.postForEntity("http://localhost:8383/saveClaim", request, Object.class);
		Object objects = responseEntity.getBody();
		
		//ObjectMapper mapper = new ObjectMapper();
		JsonNode returnObj = mapper.convertValue(objects, JsonNode.class);
		
		return returnObj;
	} 
	
	public JsonNode findClaimByCustomerId(Long customerId) {
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<Object> responseEntity = restTemplate.getForEntity("http://localhost:8383/findClaimByCustomerId/"+customerId, Object.class);
		Object objects = responseEntity.getBody();
		
		ObjectMapper mapper = new ObjectMapper();
		JsonNode returnObj = mapper.convertValue(objects, JsonNode.class);
		
		return returnObj;
	}
	
	public JsonNode updateClaimStatus(Long claimId, String status) {
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<Object> responseEntity = restTemplate.getForEntity("http://localhost:8383/updateClaimStatus/"+claimId+"/"+status, Object.class);
		Object objects = responseEntity.getBody();
		
		ObjectMapper mapper = new ObjectMapper();
		JsonNode returnObj = mapper.convertValue(objects, JsonNode.class);
		
		return returnObj;
	} 
}
