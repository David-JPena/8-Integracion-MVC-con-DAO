/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.List;
import java.util.ArrayList;
import modelo.Producto;
import org.bson.Document;

/**
 *
 * @author Usuario
 */
public class MantenimientoMongo implements Libreria {
    
    private final String host;
    private final int port;
    private final String database;
    
    public MantenimientoMongo(String host, int port, String database) {
        this.host = host;
        this.port = port;
        this.database = database;
    }
    
        @Override
    public Connection conectar() {
        MongoClient mongoClient = new MongoClient(host, port);
        return (Connection) mongoClient;
    }
    

    private MongoCollection<Document> getCollection() {
        MongoClient mongoClient = (MongoClient) conectar();
        MongoDatabase db = mongoClient.getDatabase(database);
        MongoCollection<Document> collection = db.getCollection("producto");
        return collection;
    }

    @Override
    public void registrar(int codigo, String nombre, double precio, int stock) {
        try {
            MongoCollection<Document> collection = getCollection();
            Document doc = new Document("codigo", codigo)
                    .append("nombre", nombre)
                    .append("precio", precio)
                    .append("stock", stock);
            collection.insertOne(doc);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public ResultSet listar() {
        List<Producto> productos = new ArrayList<Producto>();
        try {
            MongoCollection<Document> collection = getCollection();
            for (Document doc : collection.find()) {
                Producto producto = new Producto();
                producto.setCodigo(doc.getString("codigo"));
                producto.setNombre(doc.getString("nombre"));
                producto.setPrecio(doc.getDouble("precio"));
                producto.setStock(doc.getInteger("stock"));
                productos.add(producto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (ResultSet) productos;
    }

    @Override
    public ResultSet buscar(String nombre) {
        Producto producto = null;
        try (MongoClient mongoClient = (MongoClient) conectar()) {
            MongoDatabase db = mongoClient.getDatabase(database);
            MongoCollection<Document> collection = db.getCollection("producto");
            Document doc = collection.find(Filters.eq("nombre", nombre)).first();
            if (doc != null) {
                producto = new Producto();
                producto.setCodigo(doc.getString("codigo"));
                producto.setNombre(doc.getString("nombre"));
                producto.setPrecio(doc.getDouble("precio"));
                producto.setStock(doc.getInteger("stock"));
            }
        }
        return (ResultSet) producto;
    }

}
