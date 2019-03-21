package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
public class DemoController {
	@GetMapping("/")
	public Map<String, String> get() {
		return Map.of("hello", "world again again again!");
	}
}
