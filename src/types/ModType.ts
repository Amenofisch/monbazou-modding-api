import TagType from "./TagType";

type ModType = {
    id: Number;
    name: string;
    description: string;
    image: string | null | undefined;
    author: string;
    nexusmods_id: Number;
    tags: Number[] | TagType[];
    depends_on: ModType[] | Number[];
    dbtags?: TagType[];
    dbdependencies?: ModType[];
    trending?: boolean;
    uuid: string;
}

export default ModType;