package shu.xai.demo.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.neo4j.ogm.annotation.GeneratedValue;
import org.neo4j.ogm.annotation.Id;
import org.neo4j.ogm.annotation.NodeEntity;


@NodeEntity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommonNode {

	@Id
	@GeneratedValue
	private Long id;
	private String name;


	/**
	 * Neo4j doesn't REALLY have bi-directional relationships. It just means when querying
	 * to ignore the direction of the relationship.
	 * https://dzone.com/articles/modelling-data-neo4j
	 */
	/*
	@Relationship(type = "Located-Of")
	public Set<CommonNode> teammates;

	public void connectedWith(CommonNode node) {
		if (teammates == null) {
			teammates = new HashSet<>();
		}
		teammates.add(node);
	}

	public String toString() {
		return this.name + "'s teammates => "
				+ Optional.ofNullable(this.teammates).orElse(
						Collections.emptySet()).stream()
				.map(CommonNode::getName)
				.collect(Collectors.toList());
	}

	public String getName() {
		return name;
	}

	public Long getId() {
		return id;
	}

	public void setName(String name) {
		this.name = name;
	}
	*/
}
