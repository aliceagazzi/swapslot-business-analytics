hotel <- read.csv("hotel_booking_cancellation.csv") #dataset per gli albergi 

mean(hotel$is_canceled)
summary(hotel)
head(hotel)
hotel
is.na(hotel)
hotel$canceled_bin <- ifelse(hotel$booking.status == "Canceled", 1, 0)
table(hotel$canceled_bin)
head(hotel[, c("booking.status", "canceled_bin")])
mean(hotel$canceled_bin)

hair <- read.csv("hair_salon_no_show_wrangled_df.csv")
 #dataset per i parrucchieri 
head(hair)
mean(hair$last_cumcancel)

medico <-read.csv("appointments.csv")
medico$bin<-ifelse(medico$status == "cancelled", 1, 0)
mean(medico$bin) #probabilità per i medici 
head(medico)


