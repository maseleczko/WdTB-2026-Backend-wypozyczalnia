package pl.wsb.wypozyczalnia.rental.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import java.math.BigDecimal;
import java.time.LocalDate;

/** Wypożyczenie; powiązania z klientem i narzędziami dodamy w dalszym rozwoju. */
@Entity
@Table(name = "rental")
public class Rental {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "rental_number", nullable = false, unique = true, length = 30)
    private String rentalNumber;

    @Column(name = "start_date", nullable = false)
    private LocalDate startDate;

    @Column(name = "due_date", nullable = false)
    private LocalDate dueDate;

    @Column(name = "returned_date")
    private LocalDate returnedDate;

    // Zakres podstawowy LAB 02: status jest tekstem, bez dodatku enum na ocenę 5.
    @Column(name = "status", nullable = false, length = 20)
    private String status;

    @Column(name = "total_cost", nullable = false, precision = 10, scale = 2)
    private BigDecimal totalCost;

    protected Rental() {
    }

    public Rental(String rentalNumber, LocalDate startDate, LocalDate dueDate,
                  LocalDate returnedDate, String status, BigDecimal totalCost) {
        this.rentalNumber = rentalNumber;
        this.startDate = startDate;
        this.dueDate = dueDate;
        this.returnedDate = returnedDate;
        this.status = status;
        this.totalCost = totalCost;
    }

    public Long getId() {
        return id;
    }

    public String getRentalNumber() {
        return rentalNumber;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public LocalDate getDueDate() {
        return dueDate;
    }

    public LocalDate getReturnedDate() {
        return returnedDate;
    }

    public String getStatus() {
        return status;
    }

    public BigDecimal getTotalCost() {
        return totalCost;
    }
}
