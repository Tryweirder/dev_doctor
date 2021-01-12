import Course from "./course";
import YAML from "yaml";
import User from "./user";

export default class CoursesServer {
  public readonly url: string;
  public readonly icon: string;
  public readonly name : string;
  public readonly support : string;

  public constructor(init?: Partial<CoursesServer>) {
    Object.assign(this, init);
  }

  public async fetchCourses(): Promise<Course[]> {
    var response = await fetch(`${this.url}/config.yml`);
    var text = await response.text();
    var yaml = YAML.parse(text);
    return await Promise.all(
      (yaml["courses"] as Array<string>).map((slug) => this.fetchCourse(slug))
    );
  }
  public async fetchCourse(slug: string) : Promise<Course> {
    var response = await fetch(`${this.url}/${slug}/config.yml`);
    var text = await response.text();
    var data = YAML.parse(text);
    data['installed'] = await caches.has(`course-${slug}`);
    data['slug'] = slug;
    data['server'] = this;
    return new Course(data);
  }

  static get servers() : CoursesServer[] {
    return User.load().servers;
  }
  static set servers(value: CoursesServer[]) {
    User.load().servers = value;
  }
  static getServer(id : number) : CoursesServer {
    return this.servers[id];
  }
}