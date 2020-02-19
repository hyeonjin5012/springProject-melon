package com.nhj.springProjectmelon.model.likes;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Likes {
	private int id;
	private int userId;
	private int musicId;
}
