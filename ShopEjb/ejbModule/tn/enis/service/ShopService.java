package tn.enis.service;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateful;

import tn.enis.dto.ProductDto;

@Stateful
@LocalBean
public class ShopService {
	private List<ProductDto> products = new ArrayList<>();
	private double total;

	public void add(ProductDto product) {
		products.add(product);
	}

	public List<ProductDto> listProducts() {
		return products;
	}

	public void delete(String name) {
		products.remove(new ProductDto(name, 0, 0));
	}
}
