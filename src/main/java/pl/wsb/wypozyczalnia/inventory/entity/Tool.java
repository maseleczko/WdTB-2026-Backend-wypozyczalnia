package pl.wsb.wypozyczalnia.inventory.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import java.math.BigDecimal;

/** Pojedynczy egzemplarz narzędzia w wypożyczalni. */
@Entity
@Table(name = "tool")
public class Tool {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name", nullable = false, length = 100)
    private String name;

    @Column(name = "brand", nullable = false, length = 60)
    private String brand;

    @Column(name = "inventory_number", nullable = false, unique = true, length = 30)
    private String inventoryNumber;

    @Column(name = "daily_rate", nullable = false, precision = 10, scale = 2)
    private BigDecimal dailyRate;

    @Column(name = "technically_available", nullable = false)
    private boolean technicallyAvailable;

    protected Tool() {
    }

    public Tool(String name, String brand, String inventoryNumber,
                BigDecimal dailyRate, boolean technicallyAvailable) {
        this.name = name;
        this.brand = brand;
        this.inventoryNumber = inventoryNumber;
        this.dailyRate = dailyRate;
        this.technicallyAvailable = technicallyAvailable;
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getBrand() {
        return brand;
    }

    public String getInventoryNumber() {
        return inventoryNumber;
    }

    public BigDecimal getDailyRate() {
        return dailyRate;
    }

    public boolean isTechnicallyAvailable() {
        return technicallyAvailable;
    }
}
