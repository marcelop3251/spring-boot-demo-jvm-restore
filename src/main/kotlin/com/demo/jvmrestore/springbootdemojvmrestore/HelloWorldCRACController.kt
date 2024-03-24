package com.demo.jvmrestore.springbootdemojvmrestore

import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@RestController
class HelloWorldCRACController {

    @GetMapping("/hello")
    fun hello() = "Congratulations your execut jvm with checkpoint restore"
}