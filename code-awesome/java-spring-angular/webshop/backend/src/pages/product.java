package prg3.java_spring_angular.webshop.backend.src.pages;

import org.springframework.data.jpa.repository.JpaRepository;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.PatternValidatorException;
import org.springframework.core.convert.support.GlobalMethodConverter;
import org.springframework.util.Assert;
import java.util.List;

import javax.validation.constraints.Size;

import org.springframework.data.jpa.domain.Specification;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Long> {
    //No implementation for this repository
}

interface Product{
    Long getId();
    String getName();
    Double getPrice();
    String getDescription();
    List<String> getImages();
}