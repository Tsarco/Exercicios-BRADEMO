package br.ifsp.edu.bra.api_rest;

import org.springframework.web.bind.annotation.RequestMapping;
// Import automático: shift + alt + o
import org.springframework.web.bind.annotation.RestController;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;


@RestController
@RequestMapping("/api")
public class UserController {

    @PostMapping("user")
    public ResponseEntity<User> createUser(@RequestBody User user) {
        System.out.println(user.getLogin());
        System.out.println(user.getPassword());
        user.setLogin("user_recebido");
        // 201 created
        return ResponseEntity.created(null).body(user);
    }
    
}
