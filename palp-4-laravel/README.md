# Laravel API Endpoint

## Struktur API Route dalam Laravel
Struktur Routing dalam project ini dapat digambarkan dalam bentuk berikut:

```bash
api/products
    |GET  | ---> /        ---> ProductController@fetch
    |GET  | ---> /get     ---> ProductController@get
    |POST | ---> /create  ---> ProductController@store
    |POST | ---> /update  ---> ProductController@update
    |POST | ---> /delete  ---> ProductController@delete
```

## Contoh API Call dan Response-nya

### Fetch Products
Kirim Request ke `api/products` untuk mengambil semua data yang ada di tabel `products`.
![Screenshot 2025-04-07 170040](https://github.com/user-attachments/assets/9aac3cef-1317-4e5f-a213-0944b6e9770b)
Contoh hasilnya seperti berikut:
```json
[
    {
        "id": 1,
        "name": "Mango Sticky Rice",
        "price": 25000,
        "photo": "https://asset.kompas.com/crops/scDw0PJeIGcDcQeeC92AO5ugc1Y=/120x80:1000x667/1200x800/data/photo/2022/06/09/62a17bac71461.jpg",
        "is_promo": 0,
        "created_at": "2025-04-07T09:14:51.000000Z",
        "updated_at": "2025-04-07T09:14:51.000000Z"
    },
]
```

### Get Product
Kirim Request ke `api/products/get` dengan parameter `id` untuk mengambil data dengan id yang diinginkan, yang ada di tabel `products`.
![image](https://github.com/user-attachments/assets/4b69d1e2-c210-4eb4-b170-4924637e1d70)
Contoh hasilnya seperti berikut:
```json
[
    {
        "id": 1,
        "name": "Mango Sticky Rice",
        "price": 25000,
        "photo": "https://asset.kompas.com/crops/scDw0PJeIGcDcQeeC92AO5ugc1Y=/120x80:1000x667/1200x800/data/photo/2022/06/09/62a17bac71461.jpg",
        "is_promo": 0,
        "created_at": "2025-04-07T09:14:51.000000Z",
        "updated_at": "2025-04-07T09:14:51.000000Z"
    },
]
```

### Create Product
Kirim Request ke `api/products/create` dengan parameter `name, price, photo, is_promo` untuk menambah record baru dengan data yang dimasukkan, kedalam tabel `products`.
![image](https://github.com/user-attachments/assets/88c28000-02ca-40de-b967-fe292320d052)
Contoh hasil responnya seperti berikut:
```json
"success"
```

### Update Product
Kirim Request ke `api/products/update` dengan parameter `id, name, price, photo, is_promo` untuk mengupdate record lama dengan id yang ada, diganti dengan data baru yang dimasukkan, kedalam tabel `products`.
![image](https://github.com/user-attachments/assets/a817e621-1e7f-4559-a8df-8627a597fc3e)
Contoh hasil responnya seperti berikut:
```json
"success"
```

### Delete Product
Kirim Request ke `api/products/delete` dengan parameter `id` untuk menghapus record dengan id yang ada, didalam tabel `products`.
![image](https://github.com/user-attachments/assets/24087815-80c8-41fd-a101-d64b682acc78)
Contoh hasil responnya seperti berikut:
```json
"success"
```

